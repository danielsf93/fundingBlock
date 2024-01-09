<?php
/**
 * @file plugins/blocks/fundingBlock/fundingBlock.inc.php
 */

 import('lib.pkp.classes.plugins.BlockPlugin');

class fundingBlock extends BlockPlugin {
	//variaveis do banco de dados
    private $databaseHost;
    private $databaseName;
    private $databaseUsername;
    private $databasePassword;


	public function getContents($templateMgr, $request = null)
    {

		$configFile = 'config.inc.php';

        if (file_exists($configFile)) {
            $config = parse_ini_file($configFile, true);
            //acesso ao banco de dados
            if (isset($config['database'])) {
                $this->databaseHost = $config['database']['host'];
                $this->databaseName = $config['database']['name'];
                $this->databaseUsername = $config['database']['username'];
                $this->databasePassword = $config['database']['password'];
            }
        }

		// Chama a função para obter o número de revistas.
         
       
        $funders = $this->getFunders();
        
        $templateMgr->assign([
        // Variável com texto simples.
        'madeByText' => 'Estatísticas do portal:',
        // Variável que contém o número de revistas.
       
        'funders' => $funders, 
        
    ]);
    
    return parent::getContents($templateMgr, $request);
    }

    public function getFunders()
{
    try {
        $pdo = new PDO("mysql:host={$this->databaseHost};dbname={$this->databaseName}", $this->databaseUsername, $this->databasePassword);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT funder_id, submission_id FROM funders";
        $stmt = $pdo->query($query);
        $funders = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $funders;
    } catch (PDOException $e) {
        return [];
    }
}


//////funcoes obrigatorias do ojs
	/**
	 * Install default settings on system install.
	 * @return string
	 */
	function getInstallSitePluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
	}
	/**
	 * Install default settings on journal creation.
	 * @return string
	 */
	function getContextSpecificPluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
	}

	function getDisplayName() {
		return __('FundingBlock');
	}
    function getDescription() {
		return __('fundingBlock');
	}
}



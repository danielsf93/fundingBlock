{* plugins/blocks/deepStat/block.tpl *}

<div class="pkp_block block_madeBy">
    <h3>{translate key="Dados de financiamento"}</h3>

    <b>{$totalDownloads}</b> {translate key="Downloads"}<br>
    <b>{$totalAcess}</b> {translate key="Acessos"}<br>

    {if $funders|@count > 0}
        <h4>{translate key="Lista de financiadores:"}</h4>
        <ul>
            {foreach from=$funders item=funder}
                <li>{$funder|escape}</li>
            {/foreach}
        </ul>
    {else}
        <p>{translate key="Nenhum financiador encontrado."}</p>
    {/if}

    id: {$publication->getId()|escape}
</div>

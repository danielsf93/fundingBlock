{* plugins/blocks/deepStat/block.tpl *}

<div class="pkp_block block_madeBy">
    {assign var="foundFunders" value=false}
    
    {if isset($publication) && $publication->getId()|default:false}
        {if $funders|@count > 0}
            <h3>{translate key="plugins.block.fundingBlock.title"}</h3>
            <ul>
                {foreach from=$funders item=funder}
                    {if $funder.submission_id == $publication->getId()|escape}
                        {assign var="foundFunders" value=true}
                        <li>
                            Funder ID: {$funder.funder_id|escape}<br>
                            Submission ID: {$funder.submission_id|escape}
                        </li>
                    {/if}
                {/foreach}
            </ul>
            {if $foundFunders}
                id: {$publication->getId()|escape}
            {/if}
        {else}
            <p>{translate key="Nenhum financiador encontrado."}</p>
        {/if}
    {else}
        <p>{translate key="plugins.block.fundingBlock.noid"}</p>
    {/if}
</div>
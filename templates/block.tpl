{* plugins/blocks/deepStat/block.tpl *}

<div class="pkp_block block_madeBy">
    <h3>{translate key="Dados de financiamento"}</h3>

    {if $funders|@count > 0}
        <ul>
            {foreach from=$funders item=funder}
                {if $funder.submission_id == $publication->getId()|escape}
                    <li>
                        Funder ID: {$funder.funder_id|escape}<br>
                        Submission ID: {$funder.submission_id|escape}
                    </li>
                {/if}
            {/foreach}
        </ul>
    {else}
        <p>{translate key="Nenhum financiador encontrado."}</p>
    {/if}

    id: {$publication->getId()|escape}
</div>


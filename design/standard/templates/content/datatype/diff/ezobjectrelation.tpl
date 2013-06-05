{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{def $state=array( 'old', 'new' )
     $counter=0}
{foreach array( $diff.old_content, $diff.new_content ) as $attr}
    <div class="attribute-view-diff-{$state[$counter]}">
    {set $counter=inc( $counter )}
    <label>{'Version %ver'|i18n( 'design/standard/content/datatype',, hash( '%ver', $attr.version ) )}:</label>
    {if $attr.content}
            <table class="list" cellspacing="0">
            <tr>
                <th class="tight">{'Related object ID'|i18n( 'design/standard/content/datatype' )}</th>
                <th>{'Object name'|i18n( 'design/standard/content/datatype' )}</th>
                <th>{'Type'|i18n( 'design/standard/content/datatype' )}</th>
                <th>{'Modified'|i18n( 'design/standard/content/datatype' )}</th>
                <th>{'Creator'|i18n( 'design/standard/content/datatype' )}</th>
            </tr>
            <tr>
            {if $attr.content.can_read}
                <td>{$attr.content.id}</td>
                <td>{$attr.content.name|wash}</td>
                <td>{$attr.content.class_name|wash}</td>
                <td>{$attr.content.modified|l10n( 'shortdatetime' )}</td>
                <td>{$attr.content.current.creator.name|wash}</td>
            {else}
                <td colspan="5"><em>{'You are not allowed to view the related object'|i18n( 'design/standard/content/datatype' )}</em></td>
            {/if}
            </tr>
            </table>
    {else}
       {'No relation'|i18n( 'design/standard/content/datatype' )}
    {/if}
    </div>
{/foreach}

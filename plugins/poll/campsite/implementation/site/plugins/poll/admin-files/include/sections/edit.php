<?php
$section_language_id = $sectionObj->getLanguageId();
$section_nr = $sectionObj->getSectionNumber();
$issue_nr = $sectionObj->getIssueNumber();
$publication_id = $sectionObj->getPublicationId();
?>
<P>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="6" CLASS="table_input">
<TR>
	<TD>
		<B><?php  putGS("Polls"); ?></B>
	</TD>
    <?php if ($g_user->hasPermission('ManagePoll')) {  ?>
    	<TD align="right">
    		<IMG src="<?php p($Campsite["ADMIN_IMAGE_BASE_URL"]);?>/configure.png" border="0">
    		<A href="javascript: void(0);" onclick="window.open('<?php p("/$ADMIN/poll/assign_popup.php?f_target=section&amp;f_section_nr=$section_nr&amp;f_section_language_id=$section_language_id&amp;f_issue_nr=$issue_nr&amp;f_publication_id=$publication_id"); ?>', 'assign_poll', 'scrollbars=yes, resizable=yes, menubar=no, toolbar=no, width=500, height=400, top=200, left=100');"><?php putGS("Edit"); ?></A>
    	</TD>
    <?php } ?>
</TR>
<TR>
	<TD colspan="2">
		<HR NOSHADE SIZE="1" COLOR="BLACK">
	</TD>
</TR>
<TR>
    <TD>
    	<div style="overflow: auto; max-height: 50px">  
        <?php
        foreach (PollSection::getAssignments(null, null, $sectionObj->getLanguageId(), $sectionObj->getSectionNumber(), $sectionObj->getIssueNumber(), $sectionObj->getPublicationId()) as $pollIssue) {
            $poll = $pollIssue->getPoll();	
            p($poll->getName());
    		p("&nbsp;({$poll->getLanguageName()})<br>");
    	} 
    	?>
    	</div>
    </TD>
</TR>
</TABLE>
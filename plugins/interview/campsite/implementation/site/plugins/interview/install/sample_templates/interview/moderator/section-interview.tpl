{{ include file="html_header.tpl" }}

<h6>{{ $smarty.template }}</h6>

<table class="main" cellspacing="0" cellpadding="0">
<tr>
  <td valign="top">
    <div id="breadcrubm">
    {{ breadcrumb }}
    </div>
    {{** main content area **}}
    <table class="content" cellspacing="0" cellpadding="0">
    <tr>
      <td>  
        
        {{ if $campsite->user->has_permission('plugin_interview_moderator') }}               
            
            {{ if $smarty.request.interview_action || $campsite->interview_action->defined }}
            
                {{ include file='interview/moderator/interview-action.tpl }} 
    
            {{ elseif $smarty.request.interviewitem_action || $campsite->interviewitem_action->defined }}
            
                {{ include file='interview/moderator/interviewitem-action.tpl }} 
           
             {{ elseif $campsite->interviewitem->defined }}
            
                {{ include file='interview/interviewitem-details.tpl' }}
                {{ include file='interview/moderator/interviewitem-actions.tpl' }}
    
                
            {{ elseif $campsite->interview->defined }}
            
                {{ include file='interview/interview-details.tpl' }}
                {{ include file='interview/moderator/interview-actions.tpl' }}
                        
            {{ else }}
            
                {{ include file='interview/moderator/interviews-list.tpl' }}
                
            {{ /if }}
        
        {{ else }}
            No permission
        {{ /if }}  
        
      </td>
    </tr>
    </table>
    {{** end main content area **}}
  </td>
  <td valign="top">
    {{ include file="html_rightbar.tpl" }}
  </td>
</tr>
</table>

{{ include file="html_footer.tpl" }}
<?php
/**
 * @package Campsite
 */

/**
 * Includes
 */
// We indirectly reference the DOCUMENT_ROOT so we can enable
// scripts to use this file from the command line, $_SERVER['DOCUMENT_ROOT']
// is not defined in these cases.
$g_documentRoot = $_SERVER['DOCUMENT_ROOT'];

require_once($g_documentRoot.'/classes/Publication.php');
require_once($g_documentRoot.'/classes/Alias.php');
require_once($g_documentRoot.'/template_engine/metaclasses/MetaDbObject.php');

/**
 * @package Campsite
 */
final class MetaPublication extends MetaDbObject {

	private function InitProperties()
	{
		if (!is_null($this->m_properties)) {
			return;
		}
		$this->m_properties['name'] = 'Name';
		$this->m_properties['identifier'] = 'Id';
	}


    public function __construct($p_publicationId = null)
    {
		$this->m_dbObject = new Publication($p_publicationId);

		$this->InitProperties();
		$this->m_customProperties['default_language'] = 'getDefaultLanguage';
		$this->m_customProperties['site'] = 'getDefaultSiteName';
        $this->m_customProperties['defined'] = 'defined';
        $this->m_customProperties['public_comments'] = 'getPublicComments';
        $this->m_customProperties['moderated_comments'] = 'getModeratedComments';
        $this->m_customProperties['captcha_enabled'] = 'getCAPTCHAEnabled';
    } // fn __construct


	protected function getDefaultSiteName()
	{
		$defaultAlias = new Alias($this->m_dbObject->getDefaultAliasId());
		if (!$defaultAlias->exists()) {
			return null;
		}
		return $defaultAlias->getName();
	}


	protected function getDefaultLanguage()
	{
	    return new MetaLanguage($this->m_dbObject->getDefaultLanguageId());
	}

	
	protected function getPublicComments() {
	    return $this->m_dbObject->publicComments();
	}


	protected function getModeratedComments() {
	    if (CampTemplate::singleton()->context()->user->logged_in) {
	        return $this->m_dbObject->commentsSubscribersModerated();
	    } else {
	        return $this->m_dbObject->commentsPublicModerated();
	    }
	}


	protected function getCAPTCHAEnabled() {
	    return $this->m_dbObject->isCaptchaEnabled();
	}
} // class MetaPublication

?>
CREATE OR REPLACE PACKAGE jira_sdk AS

    -- global constants
    gc_wallet_path CONSTANT VARCHAR2 (255) := '';
    gc_wallet_pwd CONSTANT VARCHAR2 (255) := '';
    
    gc_basic_auth_string CONSTANT VARCHAR2 (255) := 'cGF1bGpAZGV2bW5rcy5vbm1pY3Jvc29mdC5jb206dno2MkgxOWRXS1lIV25mRlFTbnBFMDI1';
    
    -- endpoint urls
    gc_base_url CONSTANT VARCHAR2 (255) := 'https://devmnks.atlassian.net';
    gc_issue_url CONSTANT VARCHAR2 (255) := gc_base_url || '/rest/api/3/issue/';
     
    -- function definitions
    FUNCTION json_get_issue ( p_issue_id IN VARCHAR2 ) RETURN CLOB;
        
END jira_sdk;
/

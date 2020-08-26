CREATE OR REPLACE PACKAGE BODY jira_sdk AS

PROCEDURE set_authorization_header IS
    
BEGIN 
    
    apex_web_service.g_request_headers.delete();
    apex_web_service.g_request_headers(1).name := 'Authorization';
    apex_web_service.g_request_headers(1).value := 'Basic ' || gc_basic_auth_string;

END set_authorization_header;

PROCEDURE set_content_type_header IS
BEGIN 

    apex_web_service.g_request_headers(2).name := 'Content-Type';
    apex_web_service.g_request_headers(2).value := 'application/json';

END set_content_type_header;

FUNCTION json_get_issue ( p_issue_id IN VARCHAR2 ) RETURN CLOB IS

    v_request_url VARCHAR2 (255);
    v_response CLOB;
    
BEGIN

    v_request_url := gc_issue_url || p_issue_id;

    set_authorization_header;
    set_content_type_header;

    v_response := apex_web_service.make_rest_request ( p_url => v_request_url,
                                                       p_http_method => 'GET',
                                                       p_wallet_path => gc_wallet_path,
                                                       p_wallet_pwd => gc_wallet_pwd );
                                                       

    RETURN v_response;

END json_get_issue;

END jira_sdk;
/

<?php

/**
 * Fired during plugin REST api
 *
 * @link       http://example.com
 * @since      1.0.0
 *
 * @package    Plugin_Name
 * @subpackage Plugin_Name/includes
 */

/**
 * Fired during plugin REST api.
 *
 * This class defines all code necessary to run during the plugin's activation.
 *
 * @since      1.0.0
 * @package    Plugin_Name
 * @subpackage Plugin_Name/includes
 * @author     Your Name <email@example.com>
 */
class Plugin_Name_Api
{

    /**
     * Short Description. (use period)
     *
     * Long Description.
     *
     * @since    1.0.0
     */
    public function register_routes()
    {
        register_rest_route('plugin-name/v1', '/plugin-name/(?P<op>\w+)', array(
            'methods' => 'POST',
            'callback' => array($this, 'plugin-name'),
        ));
        flush_rewrite_rules();
    }
    public function plugin_name($request)
    {
        $op = $request['op'];
        $data = array();
        if ($op == 'get-plugin-name') {
            $data['plugin_name'] = 'Plugin Name';
        }
        wp_send_json($data);
        wp_die();
    }
}


/*
 * GET wordpress pages.
 */
var request = require('request');

exports.find = function(req, res){
    var wpData = "";
    var wpPage = {};
    var slug = req.params.slug;
    var url = 'http://local.wordpress.dev/' + slug + '/?json=1';

    console.log('looking up data from wordpress...');

    request(url, function (error, response, body) {
        if (!error && response.statusCode == 200) {
            wpData = JSON.parse(body);
            console.log(wpData.page);
            if(wpData.page != undefined) {
                if(wpData.page.status == 'publish') {
                    wpPage = wpData.page;
                    res.render('wp-render', { title: wpPage.title, body: wpPage.content });
                }
            } else if(wpData.post != undefined) {
                if(wpData.post.status == 'publish') {
                    wpPage = wpData.post;
                    res.render('wp-render', { title: wpPage.title, body: wpPage.content });
                }
            } else {
                res.render('index', { title: 'not found'});
            }
        } else {
            res.render('index', { title: 'error'});
        }
    })
    
};
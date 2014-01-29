# NodeJS pulling data from a WordPress CMS

Vagrant provisioning based on [Varying Vagrant Vagrants](https://github.com/10up/varying-vagrant-vagrants).

## Overview

### This is just a starting proof of concept for provisioning WordPress and using a NodeJS server to parse slugs for content stored in the WordPress CMS.

## Getting Started

### The First Vagrant Up

1. Start with any operating system.
1. Install [VirtualBox 4.2.x](https://www.virtualbox.org/wiki/Download_Old_Builds_4_2) or [VirtualBox 4.3.4](https://www.virtualbox.org/wiki/Downloads)
    * Major portions of VirtualBox were rewritten for 4.3, and it's possible that there are still bugs to be shaken out. VVV is completely compatible with earlier versions of VirtualBox, so 4.2.18 or earlier would be just fine. Do note that Vagrant had specific issues with 4.2.16. Going as far back as 4.2.10 will likely be of no issue.
    * VVV itself leans in the 4.3.x direction in the master branch to stay ahead of the curve.
1. Install [Vagrant 1.4.0](http://www.vagrantup.com/downloads.html)
    * `vagrant` will now be available as a command in your terminal, try it out.
    * ***Note:*** If Vagrant is already installed, use `vagrant -v` to check the version. You may want to consider upgrading if a much older version is in use.
    * ***Note:*** If VirtualBox 4.3.x is installed, Vagrant 1.3.5 or later is required.
1. Install the [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) plugin with `vagrant plugin install vagrant-hostsupdater`
    * Note: This step is not a requirement, though it does make the process of starting up a virtual machine nicer by automating the entries needed in your local machine's `hosts` file to access the provisioned VVV domains in your browser.
    * If you choose not to install this plugin, a manual entry should be added to your local `hosts` file that looks like this: `192.168.50.4  vvv.dev local.wordpress.dev local.wordpress-trunk.dev src.wordpress-develop.dev build.wordpress-develop.dev`
1. Clone or extract the project into a local directory
    * `git clone git://github.com/jsarracco/node-with-wordpress-cms.git vagrant-local`
1. Change into the new directory with `cd vagrant-local`
1. Start the Vagrant environment with `vagrant up`
    * Be patient as the magic happens. This could take a while on the first run as your local machine downloads the required files.
    * Watch as the script ends, as an administrator or `su` ***password may be required*** to properly modify the hosts file on your local machine.
1. Visit any of the following default sites in your browser:
    * [http://local.wordpress.dev/](http://local.wordpress.dev/) for WordPress stable
    * [http://local.wordpress-trunk.dev/](http://local.wordpress-trunk.dev/) for WordPress trunk
    * [http://src.wordpress-develop.dev/](http://src.wordpress-develop.dev/) for trunk WordPress development files
    * [http://build.wordpress-develop.dev/](http://build.wordpress-develop.dev/) for the version of those development files built with Grunt
    * [http://vvv.dev/](http://vvv.dev/) for a default dashboard containing several useful tools

### NodeJS

1. The provision-post.sh file will add additional node modules and start the NodeJS Server, then you can go to:
    * [http://local.wordpress.dev:3000/](http://local.wordpress.dev:3000/) for WordPress stable
1. Sample posts can be viewed here:
    * Hello World Post - [http://local.wordpress.dev/hello-world](http://local.wordpress.dev/hello-world) - [http://local.wordpress.dev:3000/hello-world](http://local.wordpress.dev:3000/hello-world)
    * Sample Page - [http://local.wordpress.dev/sample-page](http://local.wordpress.dev/sample-page) - [http://local.wordpress.dev:3000/sample-page](http://local.wordpress.dev:3000/sample-page)
1. Log into [http://local.wordpress.dev/](http://local.wordpress.dev/) admin and add a page or a post, the same url should appear on the NodeJS Server.

#### Caveats

The network configuration picks an IP of 192.168.50.4. This works if you are *not* on the 192.168.50.x sub domain, it could cause conflicts on your existing network if you *are* on a 192.168.50.x sub domain already. You can configure any IP address in the `Vagrantfile` and it will be used on the next `vagrant up`

### Credentials and Such

All database usernames and passwords for WordPress installations included by default are `wp` and `wp`.

All WordPress admin usernames and passwords for WordPress installations included by default are `admin` and `password`.

#### WordPress Stable
* URL: `http://local.wordpress.dev`
* DB Name: `wordpress_default`

#### WordPress Trunk
* URL: `http://local.wordpress-trunk.dev`
* DB Name: `wordpress_trunk`

#### WordPress Develop
* /src URL: `http://src.wordpress-develop.dev`
* /build URL: `http://build.wordpress-develop.dev`
* DB Name: `wordpress_develop`
* DB Name: `wordpress_unit_tests`

#### MySQL Root
* User: `root`
* Pass: `root`
* See: [Connecting to MySQL](https://github.com/10up/varying-vagrant-vagrants/wiki/Connecting-to-MySQL) from your local machine

### What do you get?

A bunch of stuff!

1. [Ubuntu](http://www.ubuntu.com/) 12.04 LTS (Precise Pangolin)
1. [WordPress Develop](http://develop.svn.wordpress.org/trunk/)
1. [WordPress Stable](http://wordpress.org/)
1. [WordPress Trunk](http://core.svn.wordpress.org/trunk/)
1. [WP-CLI](http://wp-cli.org/)
1. [nginx](http://nginx.org/) 1.4.x
1. [mysql](http://www.mysql.com/) 5.5.x
1. [php-fpm](http://php-fpm.org/) 5.4.x
1. [memcached](http://memcached.org/) 1.4.13
1. PHP [memcache extension](http://pecl.php.net/package/memcache/3.0.8/) 3.0.8
1. PHP [xdebug extension](http://pecl.php.net/package/xdebug/2.2.3/) 2.2.3
1. PHP [imagick extension](http://pecl.php.net/package/imagick/3.1.0RC2/) 3.1.0RC2
1. [xdebug](http://xdebug.org/) 2.2.3
1. [PHPUnit](http://pear.phpunit.de/) 3.7.24
1. [ack-grep](http://beyondgrep.com/) 2.04
1. [git](http://git-scm.com/) 1.8.5
1. [subversion](http://subversion.apache.org/) 1.7.9
1. [ngrep](http://ngrep.sourceforge.net/usage.html)
1. [dos2unix](http://dos2unix.sourceforge.net/)
1. [Composer](https://github.com/composer/composer)
1. [phpMemcachedAdmin](https://code.google.com/p/phpmemcacheadmin/) 1.2.2 BETA
1. [phpMyAdmin](http://www.phpmyadmin.net/) 4.0.10 (multi-language)
1. [Webgrind](https://github.com/jokkedk/webgrind)
1. [NodeJs](http://nodejs.org/) Current Stable Version
1. [grunt-cli](https://github.com/gruntjs/grunt-cli) Current Stable Version


vagrant-i3live
========================

This project provides a Scientific Linux 6 development
environment/test VM for IceCube Live, the experiment control and
monitoring system for IceCube.

Dependencies you'll need to install:

1. [Virtualbox](https://www.virtualbox.org/).
1. [Vagrant](http://vagrantup.com/).

To create the VM (replace `some_directory` by any name to your convenience):

1. `mkdir some_directory`
1. `git clone https://github.com/eigenhombre/vagrant-i3live.git some_directory` or otherwise checkout this repository
1. `cd` into the resulting directory
1. `vagrant up`  **NOTE:** This will take awhile the first time you run it.

The directory from which you run `vagrant up` will be shared on the VM
in `/vagrant`. This means you can edit files on your laptop and they
will show up in the VM (and vice-versa).

To login:

    vagrant ssh

To finish the I3Live installation, you will need to check out IceCube
Live from Git (private GitHub repo, or clone a colleague's repo). It
is recommended that you do this **in the shared directory**
(`/vagrant`) so you can continue to use your favorite editor while
writing I3Live code (files in `/vagrant` on the guest Sci Linux 6
guest will be the same as those in your original Vagrant directory.

For example, assuming your GitHub username is `githubber`, and you've
forked `https://github.com:/eigenhombre/IceCube-Live` to that account,
as well as added your public key to GitHub, then:

    vagrant ssh # if you didn't already do it

... in your VM, `git clone` *your* fork of I3Live. Note that you
should not clone the `eigenhombre` fork: you want to be able to push
any local changes you make on the VM up to your fork and issue pull
requests from there:

    cd /vagrant
    # change githubber to your username:
    git clone git@github.com:githubber/IceCube-Live.git live  

... and make sure it's up to date with the latest production master:

    cd live
    # Do once:
    git remote add upstream git@github.com:eigenhombre/IceCube-Live.git
    # Do occasionally:
    git fetch upstream; git merge upstream/master

In the same directory, install the code into the local virtualenv:

    ./setup.py develop

The last step will download needed Python dependencies.

*NOTE*: if you see a stacktrace ending in

     TypeError: 'NoneType' object is not callable

it should still work fine (it seems to be a result of a slightly flaky
dependency installation process); if in doubt, run `./setup.py
develop` again.

*NOTE*: At the moment, the `python-twitter` module must be installed
 manually as well:

    pip install python-twitter

This is due to a conflict with I3Live's Fabric / Kickstart
installation which is under investigation.

The before running the database server or webserver (or whenever the
I3Live view code is updated), you'll want to set up the MySQL DB:

    cd liveview
    python manage.py syncdb

You will be asked if you want to create a Django superuser, which is
usually a good idea (it allows you to manually edit records in the
MySQL tables). Then,

    python manage.py migrate

To run all the automated tests,

    livetests

Then do `livecmd launch`, `livecmd check`, `livecmd tail`, etc., as desired.

To run `dbserver`,

    dbserver -d

To run the Web site (via test server),

    cd /vagrant/live/liveview
    DJANGO_DEBUG=on python manage.py runserver 0.0.0.0:8000

The Web site can then be viewed on the host OS (laptop) as
[http://localhost:8000](http://localhost:8000).

### Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN
NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
OR OTHER DEALINGS IN THE SOFTWARE.

(Basically, use at your own risk.)

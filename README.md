vagrant-i3live
========================

Scientific Linux 6 VM for IceCube Live

Dependencies you'll need to install:

1. [Virtualbox](https://www.virtualbox.org/).
1. [Vagrant](http://vagrantup.com/).

To use:

1. `git clone` or otherwise checkout this repository and `cd` into the resulting directory.
1. `vagrant up`  **NOTE:** This will take awhile the first time you run it.

The directory from which you run `vagrant up` will be shared on the VM
in `/vagrant`. This means you can edit files on your laptop and they
will show up in the VM (and vice-versa).

To login:

1. `vagrant ssh`.

To finish the I3Live installation, you will need to check out IceCube
Live from Git (private GitHub repo, or clone a colleague's repo). It
is recommended that you do this **in the shared directory**
(`/vagrant`) so you can continue to use your favorite editor while
writing I3Live code (files in `/vagrant` on the guest Sci Linux 6
guest will be the same as those in your original Vagrant directory.

Then, in the resulting I3Live directory **on the VM**,

    ./setup.py develop

The last step will download needed Python dependencies.

To run all the automated tests,

    livetests

Then do `livecmd launch`, `livecmd check`, `livecmd tail`, etc., as desired.

To run `dbserver`,

    dbserver -d

To run the Web site (via test server),

    cd liveview
    python manage.py syncdb   # once
    python manage.py migrate  # once
    DJANGO_DEBUG=on python manage.py runserver 0.0.0.0:8000  # every time

### Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN
NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
OR OTHER DEALINGS IN THE SOFTWARE.

(Basically, use at your own risk.)

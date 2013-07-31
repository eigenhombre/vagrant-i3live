vagrant-i3live
========================

Scientific Linux 6 VM for IceCube Live

Dependencies:

1. [Virtualbox](https://www.virtualbox.org/).
1. [Vagrant](http://vagrantup.com/).

To use:

1. `git clone` or otherwise checkout this repository and `cd` into the resulting directory.
1. `vagrant up`  **NOTE:** This will take awhile the first time you run it.

The directory from which you run 'vagrant up' will be shared on the VM
in `/vagrant`. This means you can edit files on your laptop and they
will show up in the VM.

To login:

1. `vagrant ssh`.

To finish the I3Live installation, you will need to checkout IceCube
Live from Git (private GitHub repo, or clone a colleague's repo).
Then, in the resulting I3Live directory,

    ./setup.py develop

The last step will download needed Python dependencies.

To run all the automated tests,

    livetests

Then do `livecmd launch`, `livecmd check`, etc., as desired.

### Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN
NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
OR OTHER DEALINGS IN THE SOFTWARE.

(Basically, use at your own risk.)

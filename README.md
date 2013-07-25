vagrant-sci-linux-6
========================

Scientific Linux 6 VM with various developer dependencies:

* Ruby
* Puppet
* Python 2.6
* Virtualenv
* Java (JVM + compiler)
* Leiningen (Clojure)
* ZeroMQ (libs + dev package)
* Node.js
* Git
* Subversion
* MySQL
* Postgres (installed but not started)

These are the things I need for various projects; you may wish to edit
`Vagrantfile` and/or `manifests/scientificlinux-60.pp` to suit.

To use:

1. `git clone` or otherwise checkout this repository and `cd` into the resulting directory.
1. install [Virtualbox](https://www.virtualbox.org/).
1. install [Vagrant](http://vagrantup.com/).
1. `vagrant box add scientificlinux-60 http://vagrant.phys.uvic.ca/scientificlinux-61.box`
1. `vagrant up`  **NOTE:** This will take awhile the first time you run it.

To login:

1. `vagrant ssh`.

### Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN
NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
OR OTHER DEALINGS IN THE SOFTWARE.

(Basically, use at your own risk.)

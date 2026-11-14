class Xefm < Formula
  include Language::Python::Virtualenv

  desc "Dual-pane file manager for the terminal"
  homepage "https://github.com/crftwr/xefm"
  url "https://files.pythonhosted.org/packages/4c/c3/7d0be6ab0f9dbee9ad02e4505d582bf1adbefd84f242a920fb5d2452e533/xefm-1.15.1.tar.gz"
  sha256 "23b691d59dfce78686e607649d3ebebcc36e6f8dbb55f5bfba430e32ae08fcae"
  license "MIT"

  bottle do
    root_url "https://github.com/crftwr/homebrew-tap/releases/download/xefm-1.10.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b19faab6b770e0fd846e337e136079c7ba424653f8153ac4587cdb5010c00508"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2b0643076c2cf35991807c9d7b930d842efe104d4120822597746c3f705508d9"
  end

  depends_on "libarchive"
  # numpy lets Find Similar Files group a large video library in minutes
  # rather than an hour (similar-files 0.4.0 and later use it when present).
  depends_on "numpy"
  depends_on "pillow"
  depends_on "python@3.14"

  on_macos do
    # Foundation and AppKit: the Trash, Connect to Server, and the OS image
    # decoder the terminal viewer borrows for HEIC / RAW. PuiKit's other PyObjC
    # frameworks (Quartz, Metal, CoreText) serve only the desktop backend,
    # which is the cask's job, so they are left out.
    resource "pyobjc-core" do
      url "https://files.pythonhosted.org/packages/a5/78/abc4ce5920305780aeb36b4067a86253378b36e29ba96673a3deb02eb03a/pyobjc_core-12.2.2.tar.gz"
      sha256 "3906452339cd06a3bb07df103c2511d4cb0f7a22d8771c0b802eba15d9a642b6"
    end

    resource "pyobjc-framework-cocoa" do
      url "https://files.pythonhosted.org/packages/75/76/49c6da2c6a831020b4854ba20079d5a1030474bffc776b7b73c2eeff8c15/pyobjc_framework_cocoa-12.2.2.tar.gz"
      sha256 "c96c0ef69a71afbbb0e6a7d594b455c5fe47d62e0db376ee7a2b4b828c16ace9"
    end

    # HTTPS verified by Security.framework instead of OpenSSL against a CA
    # file, with revocation checks (xefm#676). Its requirement is marked
    # darwin/win32, so regeneration on Linux never sees it: kept by hand too.
    resource "truststore" do
      url "https://files.pythonhosted.org/packages/ee/9f/c5201d42a484c061e528825fc8e2d565f5abd50a4ced6fb7d29c4ec99b2b/truststore-0.10.5.tar.gz"
      sha256 "30d36967ccaded5cbb38d602c433f53600036c79d502f4533a49b60a03bbefcd"
    end
  end

  # pillow and numpy come from their formulae; those PyObjC frameworks serve only the
  # desktop backend (the cask's job); the rest are Windows-only. PyObjC Core,
  # Cocoa and truststore are kept by hand in the on_macos block above, which
  # regeneration leaves alone.
  pypi_packages exclude_packages: %w[
    pillow pyobjc-framework-Quartz pyobjc-framework-Metal pyobjc-framework-CoreText
    numpy windows-curses comtypes
  ]

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/58/ab/c2d0e6b543e718af9b963e980f9e72d918c2b889cb2cc3749999f63f14f3/boto3-1.44.2.tar.gz"
    sha256 "70c02826640da17c15067033af01667059dde5e86057c2d1227cd8523c2f24dd"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/5b/fa/5cc188196076a432700671ef36c63fab463f41919b7a1440de906247bb16/botocore-1.44.2.tar.gz"
    sha256 "39da314d7bab66e9da9af5531445d237beaeeab1fce0ed034bb6315d480b85ce"
  end

  resource "doc-files" do
    url "https://files.pythonhosted.org/packages/8d/a0/f8e186f465abeaa6805691b364ab13a8860cf410d26377f117ebc3bd8b36/doc_files-0.2.0.tar.gz"
    sha256 "cd5df78dff093319eb226cee09cfaf9c08cb5c8039a33bf4660e32a9e8655a01"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/d3/59/322338183ecda247fb5d1763a6cbe46eff7222eaeebafd9fa65d4bf5cb11/jmespath-1.1.0.tar.gz"
    sha256 "472c87d80f36026ae83c6ddd0f1d05d4e510134ed462851fd5f754c8c3cbb88d"
  end

  resource "libarchive-c" do
    url "https://files.pythonhosted.org/packages/26/23/e72434d5457c24113e0c22605cbf7dd806a2561294a335047f5aa8ddc1ca/libarchive_c-5.3.tar.gz"
    sha256 "5ddb42f1a245c927e7686545da77159859d5d4c6d00163c59daff4df314dae82"
  end

  resource "puikit" do
    url "https://files.pythonhosted.org/packages/ef/c4/fde8cb5d7962351bc65f0992631a72172351c073974e2faf6fdd410ed70b/puikit-1.25.0.tar.gz"
    sha256 "fb2594d454f66ffbd52b330e7738490fbf67ae844f47ca39cfe060e70d7c5a26"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "pymigemo" do
    url "https://files.pythonhosted.org/packages/24/6a/9f3f6f80a2b32245d176d09ce6d8ec3fb26ff2958462bc34a8c17ea0916d/pymigemo-0.0.1.tar.gz"
    sha256 "ed6a85cabeb83a264f096c4271a50bcda9bdbaa47f4ae17236b04731231b0270"
  end

  resource "pypdf" do
    url "https://files.pythonhosted.org/packages/60/d3/367aa9baefaededd3321cde46bbcb9f008bb51cef3a6b745608352a99534/pypdf-7.1.0.tar.gz"
    sha256 "ca3fa902369e98a6d2cb7b56396de902b72ef9bb3c1e8706c1bfc7d8bd0cf0d7"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/49/c5/0a5ce655109cb96b8dfad36908a4e108d15f5dc2eff8fbc3146c4312e704/s3transfer-0.19.3.tar.gz"
    sha256 "8326acc3d056d7f7b8a37110c7d2aea41f67e83f6ae79cd3b5fbcca34c726406"
  end

  resource "similar-files" do
    url "https://files.pythonhosted.org/packages/8b/35/083b224d208ae5fb3cfaac864cdc766a541ec8959e7c999c4ce65a7117a7/similar_files-0.6.0.tar.gz"
    sha256 "f455eff151b3ef395fcef62600dc2e1c1b553a46a0dddf4838e7fae5a707819a"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e3/05/b17359e1cefb4f909b5e40b1b90a496d987258916dbbf88e842c729f510e/urllib3-2.8.0.tar.gz"
    sha256 "63bf2ead4c879426ebf22ef2a781eeb4aa3b4ae798a0435506f8687fd5bb9b63"
  end

  resource "watchdog" do
    url "https://files.pythonhosted.org/packages/e2/55/087e45c2a3ed8223bc9f30d6b65f051de35513cfc30c989c2b1a14bf862e/watchdog-7.1.0.tar.gz"
    sha256 "d3861e255416f49a1384474cb2efa097de165fb330d4c5432ce6708b509ed922"
  end

  def install
    venv = virtualenv_install_with_resources
    # libarchive is keg-only on macOS and outside the loader's search path on
    # Linux, so point libarchive-c at it directly (it reads LIBARCHIVE).
    rm bin/"xefm"
    (bin/"xefm").write_env_script venv.root/"bin/xefm",
      LIBARCHIVE: formula_opt_lib("libarchive")/shared_library("libarchive")
  end

  def caveats
    <<~EOS
      This is the terminal app. For the desktop app on macOS:
        brew install --cask crftwr/tap/xefm
      To add Python libraries of your own (Pillow plugins, libraries your
      config.py imports), install XeFM with uv or pipx instead.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xefm --version")
  end
end

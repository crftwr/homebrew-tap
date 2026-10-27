class Xefm < Formula
  include Language::Python::Virtualenv

  desc "Dual-pane file manager for the terminal"
  homepage "https://github.com/crftwr/xefm"
  url "https://files.pythonhosted.org/packages/bb/69/80e4c46b589efd4d5d046480baa7df9bfcb5526b39be80416d3f1475de71/xefm-1.10.1.tar.gz"
  sha256 "05c972d86cf3489787be6f8763d77a376ebe6bc1341e0550e37279db71c341bd"
  license "MIT"

  bottle do
    root_url "https://github.com/crftwr/homebrew-tap/releases/download/xefm-1.10.0_1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b7fb73e462bc1bdda890528cc81ff598569f771ab2bcc8137c8f78bd27284e4b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "23a925685a723bc6cb30540293e2e748b19f196ebdc93077ded2d832100b33d5"
  end

  depends_on "libarchive"
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

  # pillow comes from its formula; those PyObjC frameworks serve only the
  # desktop backend (the cask's job); the rest are Windows-only. PyObjC Core,
  # Cocoa and truststore are kept by hand in the on_macos block above, which
  # regeneration leaves alone.
  pypi_packages exclude_packages: %w[
    pillow pyobjc-framework-Quartz pyobjc-framework-Metal pyobjc-framework-CoreText
    numpy windows-curses comtypes
  ]

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/96/8b/5694c8433b5202f34a82def4edee274f7df1eba2919c66d9d389d2202ec8/boto3-1.43.118.tar.gz"
    sha256 "c0620f799e0f0c222ba42c337b65cdbcd3da38a3121187f634d8926cbbb28a9c"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/d4/b8/3e55154ddaf1a6d1d4ddda85c0e5983205a3b7657edacd8ebba8c6fd774c/botocore-1.43.118.tar.gz"
    sha256 "7f3f9d88cc9e847587690f82a42e3c3c292c3026c92c1e60d68a9310018e003f"
  end

  resource "doc-files" do
    url "https://files.pythonhosted.org/packages/3e/7d/2b2afd231a768de55c32e8dc6c24309e03cce6b309ca9a1817b725b6c966/doc_files-0.1.0.tar.gz"
    sha256 "904ea00816f5fdb551054bca6e9a23dbb053ffca9cad0da801853b2e9dc85bb1"
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
    url "https://files.pythonhosted.org/packages/e3/ad/b7462f5d72e8cfede60f4ab69d965328a3892cc7d39e3d76b29c563328ea/puikit-1.15.2.tar.gz"
    sha256 "fa7902b4ba62af6e1b3baaeb7e3756d2ea7f3f0a6743b21d44c72dc3fed36abd"
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
    url "https://files.pythonhosted.org/packages/06/28/081f1cbcca7042441dafc8de00f48ba60853f89e5bff92c5f26477346d81/pypdf-6.21.2.tar.gz"
    sha256 "0a3e1c5c886a1be03646c16a04827cc166c2a0575c971b26a4bf89686551c2d4"
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
    url "https://files.pythonhosted.org/packages/58/5d/d47a459ea095536aca308c0187f9d51100dafab678551153018cac829e36/similar_files-0.2.1.tar.gz"
    sha256 "6298b79794bc91a06db115bed76ee6842f287557e44480c873bd1861f726efd1"
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
    url "https://files.pythonhosted.org/packages/db/7d/7f3d619e951c88ed75c6037b246ddcf2d322812ee8ea189be89511721d54/watchdog-6.0.0.tar.gz"
    sha256 "9ddf7c82fda3ae8e24decda1338ede66e1c99883db93711d8fb941eaa2d8c282"
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

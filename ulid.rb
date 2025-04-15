class Ulid < Formula
  desc "ULID (Universally Unique Lexicographically Sortable Identifier) generator"
  homepage "https://github.com/cloudresty/goulid"
  url "https://github.com/cloudresty/goulid/archive/${GITHUB_REF_NAME}.tar.gz"
  version "${GITHUB_REF_NAME}"
  sha256 "YOUR_SHA256_CHECKSUM"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=${GITHUB_REF_NAME} -X main.repoURL=https://github.com/cloudresty/goulid"
    system "go", "build", "-ldflags", ldflags, "-o", bin/"ulid", "./cmd/ulid/main.go"
  end

  test do
    assert_match "${GITHUB_REF_NAME}", shell_output("#{bin}/ulid --version").strip
    assert_match "https://github.com/cloudresty/goulid", shell_output("#{bin}/ulid --version")
  end
end
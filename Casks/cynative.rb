cask "cynative" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.0"
  sha256 arm:   "025e82949e1105ae655fa59c6b411d1bb99988eb84eb6317625f40b0c993f4c4",
         intel: "5e2f938322ac664a6a09f8392d339ff798444682f32a35510b0318f72379c062"

  url "https://github.com/cynative/cynative/releases/download/v#{version}/cynative_Darwin_#{arch}.pkg",
      verified: "github.com/cynative/cynative/"
  name "Cynative"
  desc "Agentic security research across your code, cloud and runtime — read-only by construction"
  homepage "https://github.com/cynative/cynative"

  depends_on macos: ">= :big_sur"

  pkg "cynative_Darwin_#{arch}.pkg"

  uninstall pkgutil: "com.cynative.cynative",
            delete:  "/usr/local/bin/cynative"

  caveats <<~CAVEATS
    cynative installs to /usr/local/bin (the macOS Installer may prompt for your password).
    Set your LLM provider, model and an API key before first run, e.g.:
      export CYNATIVE_LLM_PROVIDER=anthropic
      export CYNATIVE_LLM_MODEL=claude-opus-4-8
      export ANTHROPIC_API_KEY=...
  CAVEATS
end

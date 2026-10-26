cask "pruneo" do
  version "1.1.0"
  sha256 "af318701d005e700d65f253e81bc5c26580c5c766253e01f85606c62ef3065a3"

  # Siempre baja la última versión publicada; el contador de pruneo.app la registra como «brew».
  url "https://pruneo.app/d?ref=brew&v=#{version}"
  name "Pruneo"
  desc "Safe disk cleanup with a 48-hour quarantine"
  homepage "https://pruneo.app/"

  livecheck do
    url "https://pruneo.app/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :sonoma

  app "Pruneo.app"
  binary "#{appdir}/Pruneo.app/Contents/Helpers/pruneo"

  zap trash: [
    "~/.local/bin/pruneo",
    "~/Library/Application Support/Pruneo",
    "~/Library/Caches/com.pruneo.app",
    "~/Library/HTTPStorages/com.pruneo.app",
    "~/Library/LaunchAgents/com.pruneo.app.scheduled.plist",
    "~/Library/Preferences/com.pruneo.app.plist",
    "~/Library/Saved Application State/com.pruneo.app.savedState",
  ]
end

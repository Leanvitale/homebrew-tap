cask "pruneo" do
  version "1.0.7"
  sha256 "21f1221043317816e89d8e331db70d2559d78f135c6c09c0d16d7a2a91282bb6"

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

cask "pruneo" do
  version "1.5.4"
  sha256 "b2fe2fd93b17453f6e7d5bc1bda90bd69fdf82b0bea5330b79a385261376c54e"

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

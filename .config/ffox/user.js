//// Custom firefox preferences config

// Don't focus menu bar after pressing alt key 
user_pref("ui.key.menuAccessKeyFocuses", false);

// Don't show menu bar after pressing alt key
user_pref("ui.key.menuAccessKey", false);

// Don't steal focus when opening links from other applications
user_pref("browser.tabs.loadDivertedInBackground", true);

// Highlight all occurences of find command
user_pref("findbar.highlightAll", true);

// Show protocol prefix in URL bar
user_pref("browser:urlbar:trimURLS", false);

// Disale embedded reader mode support
user_pref("reader.parse-on-load.enabled", false);

// Disale embedded screenshot support
user_pref("extensions.screenshots.disabled", true);

// Disale mozilla pocket support, set false to disable
user_pref("extensions.pocket.enabled", true);

// Open in the new tab in background
user_pref("browser.tabs.loadBookmarksInBackground", true);

// Double clicking on a word selects the word without the whitespaceses around it
user_pref("layout.word_select.eat_space_to_next_word", false);

// Middle click in the input field to paste from clipboard/primary
user_pref("middlemouse.paste", true);

// Animation speed value for smooth scrolling
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 200);

//// Privacy settings
// Disable WebRTC
user_pref("media.peerconnection.enabled", false);
user_pref("media.peerconnection.turn.disable", true);
user_pref("media.peerconnection.use_document_iceservers", false);
user_pref("media.peerconnection.video.enabled", false);
user_pref("media.peerconnection.identity.timeout", 1);

// Disable prefetching
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);
user_pref("network.prefetch-next", false);

// Isolate cookies to the first party domain
user_pref("privacy.firstparty.isolate", true);

// Reduce browser fingerprint
user_pref("privacy.resistFingerprinting", true);

// Block fingerprinting
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);

// Block cryptomining
user_pref("privacy.trackingprotection.cryptomining.enabled", true);

// Block tracking
user_pref("privacy.trackingprotection.enabled", true);

// Reduce tracking based on user clicks
user_pref("browser.send_pings", false);

// Disable URL preloading
user_pref("browser.urlbar.speculativeConnect.enabled", false);

// Reduce tracking based on clipboard usage
user_pref("dom.event.clipboardevents.enabled", false);

// Disable playback of DRM-controlled html5 content (Breaks Netflix)
// user_pref("media.eme.enabled", false);

// Disable widevine
user_pref("media.gmp-widevinecdm.enabled", false);

// Disable tracking of microfon and camera status
user_pref("media.navigator.enabled", false);

// Block third party cookies
user_pref("network.cookie.cookieBehavior", 1);

// Only send referer header to sites with the same hostname
user_pref("network.http.referer.XOriginPolicy", 2);

// Only send scheme, host and port in the referer header
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

// Disable WebGL
user_pref("webgl.disabled", true);

// Disable storing extra session data
user_pref("browser.sessionstore.privacy_level", 2);

// Disable sending additional analytics data
user_pref("beacon.enabled", false);

// Disable sending information about downloaded files to Google Safe Browsing
user_pref("browser.safebrowsing.downloads.remote.enabled", false);

// Enforce rendering Punycode equivalents
user_pref("network.IDN_show_punycode", true);

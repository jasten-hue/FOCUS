"""
Focus Test Log Analyzer - desktop shell.

This app is a thin window that loads the live Vercel site, so any new
index.html you push to Vercel shows up here automatically (no rebuild).
If the PC is offline, it falls back to the copy of index.html bundled
inside the installer.
"""
import os
import sys
import urllib.request

import webview

APP_URL = "https://focus-sigma-tan.vercel.app/"
TITLE = "FOCUS TEST LOG ANALYZER"


def resource_path(name: str) -> str:
    base = getattr(sys, "_MEIPASS", os.path.dirname(os.path.abspath(__file__)))
    return os.path.join(base, name)


def site_is_reachable(url: str, timeout: int = 5) -> bool:
    try:
        req = urllib.request.Request(url, headers={"User-Agent": "FocusTestLogAnalyzer"})
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            return resp.status < 400
    except Exception:
        return False


def main() -> None:
    # pywebview blocks file downloads by default (needed for Excel/CSV/PNG export)
    webview.settings["ALLOW_DOWNLOADS"] = True

    if site_is_reachable(APP_URL):
        url, title = APP_URL, TITLE
    else:
        url, title = resource_path("index.html"), TITLE + " (offline copy)"

    webview.create_window(title, url, width=1400, height=900, min_size=(1000, 650))
    webview.start()


if __name__ == "__main__":
    main()

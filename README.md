# homebrew-tap

مخزن رسمی **تپ هومبرو** برای اکوسیستم زبان برنامه‌نویسی کلنگ.

با این تپ، ابزارهای کلنگ را با دستورهای استاندارد هومبرو نصب می‌کنید — بدون نیاز به کامپایل یا نصب گو (Go).

## نصب

ابتدا تپ را اضافه کنید:

```bash
brew tap faralidev/tap
```

سپس ابزار موردنظر را نصب کنید:

| ابزار | توضیح | دستور نصب |
| --- | --- | --- |
| **کلنگ** | مفسر زبان برنامه‌نویسی فارسی کلنگ | `brew install kolang` |
| **لینتر کلنگ** | لینتر زبان کلنگ | `brew install kolang-linter` |
| **کلنگ IDE** | ویرایشگر دسکتاپ کلنگ | `brew install --cask kolang-ide` |

همچنین می‌توانید بدون اجرای `brew tap` و با مسیر کامل تپ نصب کنید:

```bash
brew install faralidev/tap/kolang
brew install faralidev/tap/kolang-linter
brew install --cask faralidev/tap/kolang-ide
```

## این فرمول‌ها چگونه کار می‌کنند؟

همه‌ی فرمول‌ها از **باینری‌های از پیش‌ساخته‌شده** (Prebuilt Binaries) استفاده می‌کنند که از صفحه‌ی Releases گیت‌هاب هر پروژه دانلود می‌شوند:

- `kolang` ← [faralidev/kolang/releases](https://github.com/faralidev/kolang/releases)
- `kolang-linter` ← [faralidev/kolang-linter/releases](https://github.com/faralidev/kolang-linter/releases)
- `kolang-ide` ← [faralidev/kolang-ide/releases](https://github.com/faralidev/kolang-ide/releases)

هیچ مرحله‌ی ساخت (Build) وجود ندارد؛ یعنی نه `depends_on "go"` و نه `go build` در این فرمول‌ها دیده نمی‌شود. بایگانی فشرده‌ی مخصوص سیستم‌عامل و معماری شما دانلود می‌شود، باینری داخل آن استخراج و در مسیر `bin` قرار می‌گیرد. نتیجه: نصب سریع و بدون وابستگی.

## به‌روزرسانی فرمول‌ها

بعد از انتشار یک نسخه‌ی جدید در گیت‌هاب، این مراحل را انجام دهید:

1. در فایل فرمول (`Formula/kolang.rb` یا `Formula/kolang-linter.rb`) مقدار `version` را به نسخه‌ی جدید تغییر دهید.
2. آدرس `url` به نسخه‌ی جدید اشاره کند (معمولاً با تغییر `version` خودکار درست می‌شود).
3. مقدار `sha256` را با اجرای `shasum -a 256 <فایل دانلودشده>` به‌روزرسانی کنید.
4. برای کاسک (`Casks/kolang-ide.rb`) نیز همین کار را با فایل `kolang-ide-<version>-universal.dmg` انجام دهید.
5. تغییرات را کامیت و به مخزن `faralidev/homebrew-tap` پوش کنید.

> نکته: مخزن `kolang-ide` یک گردش‌کار گیت‌هاب اکشن (`update-cask.yml`) دارد که پس از هر انتشار، کاسک را به‌صورت خودکار به‌روزرسانی و یک Pull Request باز می‌کند.

## نسخه

- همه‌ی فرمول‌ها و کاسک: **۰٫۰٫۱** (v0.0.1)

## مجوز

- MIT — «FaraliDev and contributors»، ۲۰۲۶

---

## English

**homebrew-tap** is the official Homebrew tap for the Kolang ecosystem:

```bash
brew tap faralidev/tap
brew install kolang          # interpreter
brew install kolang-linter   # linter
brew install --cask kolang-ide  # desktop editor
```

All formulas install **prebuilt binaries** from GitHub Releases — there is **no build step** (no `depends_on "go"`, no `go build`). To update a formula after a new release, bump `version` and `sha256` (and the cask URL/sha256 for the IDE).

- Version: **0.0.1** (all formulas)
- License: **MIT**
# LibreDice — a password generator built to be audited

When was the last time you read your password generator’s source code?

If you didn’t, it’s just “trust me, bro” with extra steps. Though even if you did, when a server is involved in generating passwords, you have no way to verify that the server runs the code it says it runs. Even if a tool claims to be independently audited, what prevents its authors from removing the spying part of their code prior to requesting an audit, passing the audit and then adding the spyware part back?

That’s why we made LibreDice — an offline, private and secure password generator that is built to be audited by _you_.

Check the source code — it’s quite short, and it’s commented extensively. Only then can you be certain that the code works exactly as you think it does. Copy and paste it to the AI chat of your choice and ask whether the code has any backdoors, logging or calling home.

Everything happens on your device. The whole generator is just one file that makes zero network requests. No external assets, no tracking, no cookies, no permissions.

Passwords that LibreDice generates have 111 bits of entropy. Proton suggests at least 75 bits, so our passwords are pretty secure.

## Web version

Available at [miloxeon.codeberg.page/libredice](https://miloxeon.codeberg.page/libredice).

## Console version

To download and use LibreDice in your terminal, do this:

```bash
wget https://codeberg.org/miloxeon/LibreDice/raw/branch/main/libredice.sh
```

Or, if you prefer Curl:

```bash
curl -O https://codeberg.org/miloxeon/LibreDice/raw/branch/main/libredice.sh
```

Then, make it executable:

```bash
chmod +x ./libredice.sh
```

Finally, run it:

```bash
./libredice.sh
```

## License

LibreDice is made by Milo Xeon and is available under EUPL 1.2 license. Web version is hosted in Europe by Codeberg e. V. Not affiliated with Codeberg.

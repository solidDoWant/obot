# Providers

This directory is a provider registry that ships with Obot. It holds the authentik auth provider.

- `auth-providers/` has the provider manifests that Obot reads.
- `authentik-auth-provider/` is the provider's Go module. It is a separate module from Obot's.

`make build-providers` builds each provider to `<provider>/bin/obot-provider`, where its manifest's
`command` points. To run Obot from source with these providers, build them, then add this directory
to the registries:

```sh
make build-providers
OBOT_SERVER_PROVIDER_REGISTRIES="$PWD/providers" make dev
```

The image builds the providers and copies this registry to `/obot-providers/obot-providers`.

Display text in the manifests refers to the backend catalog in
`pkg/i18n/messages/auth-providers/`, under keys that start with the manifest's file name, with
hyphens replaced by underscores.

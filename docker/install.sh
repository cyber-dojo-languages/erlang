#!/bin/sh -eu

# Records the Erlang this image holds, in the shape every image shares. erl
# reports only the major release, so the full version is read from the
# OTP_VERSION file the installed release keeps under its own root. So the
# version is one the image can run rather than one written down when someone
# last edited this file.
readonly ROOT_DIR=$(erl -noshell -eval 'io:format("~s", [code:root_dir()]), halt().')
readonly LANGUAGE_VERSION=$(cat "${ROOT_DIR}"/releases/*/OTP_VERSION)

if [ -z "${LANGUAGE_VERSION}" ]; then
  echo "Could not read a version from ${ROOT_DIR}/releases/*/OTP_VERSION" >&2
  exit 1
fi

cat > /versions.json <<EOF
{
  "language": {
    "name": "Erlang",
    "version": "${LANGUAGE_VERSION}"
  },
  "test_frameworks": []
}
EOF

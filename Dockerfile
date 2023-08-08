FROM alpine:latest as latest_unpinned

FROM alpine:latest@sha256:c5c5fda71656f28e49ac9c5416b3643eaa6a108a8093151d6d1afc9463be8e33 as latest_pinned

FROM alpine:3.18.3 as patch_unpinned

FROM alpine:3.18.3@sha256:c5c5fda71656f28e49ac9c5416b3643eaa6a108a8093151d6d1afc9463be8e33 as patch_pinned

FROM alpine:3.18 as minor_unpinned

FROM alpine:3.18@sha256:c5c5fda71656f28e49ac9c5416b3643eaa6a108a8093151d6d1afc9463be8e33 as minor_pinned


FROM alpine:edge as old_unpinned
FROM alpine:edge@sha256:880fafbab5a7 as old_pinned
FROM alpine:latest as new_unpinned
FROM alpine:latest@sha256:c5c5fda71656 as new_unpinned

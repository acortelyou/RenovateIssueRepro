FROM alpine:edge@sha256:2d01a16bab53a8405876cec4c27235d47455a7b72b75334c614f2fb0968b3f90 as old_unpinned
FROM alpine:edge@sha256:880fafbab5a7 as old_pinned
FROM alpine:latest@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as new_unpinned
FROM alpine:latest@sha256:c5c5fda71656 as new_unpinned

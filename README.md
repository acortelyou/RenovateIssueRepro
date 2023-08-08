# RenovateIssueRepro

This repo attempts to repro an issue where renovate fails to pin a docker dependency while it is being replaced.

The logs show that the replacement update for the alpine dependencies *does* contain `newDigest` so I expect to see that reflected in the generated PR. 

## Original Dockerfile

```Dockerfile
FROM alpine:latest as latest_unpinned
FROM alpine:latest@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as latest_pinned
FROM alpine:3.18.3 as patch_unpinned
FROM alpine:3.18.3@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as patch_pinned
FROM alpine:3.18 as minor_unpinned
FROM alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as minor_pinned
```

## Expected PR

```Dockerfile
FROM alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as latest_unpinned
FROM alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as latest_pinned
FROM alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as patch_unpinned
FROM alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as patch_pinned
FROM alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as minor_unpinned
FROM alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as minor_pinned
```


## Actual PR

PR: https://github.com/acortelyou/RenovateIssueRepro/pull/5

```Dockerfile
FROM alpine:3.18 as latest_unpinned
FROM alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as latest_pinned
FROM alpine:3.18 as patch_unpinned
FROM alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as patch_pinned
FROM alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as minor_unpinned
FROM alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a as minor_pinned
````

## Job Logs

```json
{
  "baseBranch": "main"
  "config": {
    "dockerfile": [
      {
        "deps": [
          {
            "depName": "alpine",
            "currentValue": "latest",
            "replaceString": "alpine:latest",
            "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
            "datasource": "docker",
            "depType": "stage",
            "updates": [
              {
                "updateType": "replacement",
                "newName": "alpine",
                "newValue": "3.18",
                "newDigest": "sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
                "branchName": "renovate/docker"
              },
              {
                "isPinDigest": true,
                "updateType": "pinDigest",
                "newValue": "latest",
                "newDigest": "sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
                "branchName": "renovate/docker"
              }
            ],
            "packageName": "alpine",
            "versioning": "docker",
            "warnings": []
          },
          {
            "depName": "alpine",
            "currentValue": "latest",
            "currentDigest": "sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
            "replaceString": "alpine:latest@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
            "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
            "datasource": "docker",
            "depType": "stage",
            "updates": [
              {
                "updateType": "replacement",
                "newName": "alpine",
                "newValue": "3.18",
                "newDigest": "sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
                "branchName": "renovate/docker"
              }
            ],
            "packageName": "alpine",
            "versioning": "docker",
            "warnings": []
          },
          {
            "depName": "alpine",
            "currentValue": "3.18.3",
            "replaceString": "alpine:3.18.3",
            "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
            "datasource": "docker",
            "depType": "stage",
            "updates": [
              {
                "updateType": "replacement",
                "newName": "alpine",
                "newValue": "3.18",
                "newDigest": "sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
                "branchName": "renovate/docker"
              },
              {
                "isPinDigest": true,
                "updateType": "pinDigest",
                "newValue": "3.18.3",
                "newDigest": "sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
                "branchName": "renovate/docker"
              }
            ],
            "packageName": "alpine",
            "versioning": "docker",
            "warnings": [],
            "registryUrl": "https://index.docker.io",
            "currentVersion": "3.18.3",
            "fixedVersion": "3.18.3"
          },
          {
            "depName": "alpine",
            "currentValue": "3.18.3",
            "currentDigest": "sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
            "replaceString": "alpine:3.18.3@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
            "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
            "datasource": "docker",
            "depType": "stage",
            "updates": [
              {
                "updateType": "replacement",
                "newName": "alpine",
                "newValue": "3.18",
                "newDigest": "sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
                "branchName": "renovate/docker"
              }
            ],
            "packageName": "alpine",
            "versioning": "docker",
            "warnings": [],
            "registryUrl": "https://index.docker.io",
            "currentVersion": "3.18.3",
            "fixedVersion": "3.18.3"
          },
          {
            "depName": "alpine",
            "currentValue": "3.18",
            "replaceString": "alpine:3.18",
            "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
            "datasource": "docker",
            "depType": "stage",
            "updates": [
              {
                "isPinDigest": true,
                "updateType": "pinDigest",
                "newValue": "3.18",
                "newDigest": "sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
                "branchName": "renovate/docker"
              }
            ],
            "packageName": "alpine",
            "versioning": "docker",
            "warnings": [],
            "registryUrl": "https://index.docker.io",
            "currentVersion": "3.18",
            "fixedVersion": "3.18"
          },
          {
            "depName": "alpine",
            "currentValue": "3.18",
            "currentDigest": "sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
            "replaceString": "alpine:3.18@sha256:7144f7bab3d4c2648d7e59409f15ec52a18006a128c733fcff20d3a4a54ba44a",
            "autoReplaceStringTemplate": "{{depName}}{{#if newValue}}:{{newValue}}{{/if}}{{#if newDigest}}@{{newDigest}}{{/if}}",
            "datasource": "docker",
            "depType": "final",
            "updates": [],
            "packageName": "alpine",
            "versioning": "docker",
            "warnings": [],
            "registryUrl": "https://index.docker.io",
            "currentVersion": "3.18",
            "fixedVersion": "3.18"
          }
        ],
        "packageFile": "Dockerfile"
      }
    ]
  }
}
```

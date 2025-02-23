# Secondary Index List Package for AWS Amplify
**Disclaimer:** 
> ## This package is not an official AWS product and is not affiliated with AWS in any way.

## Overview
This package is designed to manage secondary index lists for [Amplify Flutter](https://github.com/aws-amplify/amplify-flutter/issues/4942). With this package, integrated secondary index operations with Amplify become easier and more efficient.

## Installation
Add the package to your Pubspec.yaml file:
```yaml
dependencies:
  secondary_index_list_for_amplify: ^0.1.0
```

## Usage
```dart
ModelQueries.listByIndex(
  TaskComment.classType,     // required: model type
  queryField: 'taskId',        // required: the field to query by
  sortDirection: SortDirection.DESC,  // optional: default is DESC
  customQueryName: "listTasksCommentsByDate", // optional: provide for Gen1; auto-generated for Gen2
  where: TaskComment.TASK.eq('taskId') // condition clause for filtering
);

```
The example above demonstrates basic secondary index operations. For more detailed information and advanced configuration options, please refer to [Amplify Flutter GitHub Issue #4942](https://github.com/aws-amplify/amplify-flutter/issues/4942).

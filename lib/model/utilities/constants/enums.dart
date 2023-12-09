// enums acting like state

// page tab enum
enum TabEnum { dashboard, inventory, payments, statistics }

enum ObscureTextEnum { confirmPassword, password }

enum TargetStatus { ongoing, completed, paused }

enum DataTopUpEnum {
  onetime,
  auto,
}

enum ElectricityTopUpEnum {
  onetime,
  auto,
}

enum TargetUserType { owner, partner, sponsor }

// title subtitle enum
enum BothPosition { left, right, center }

// image type
enum ImageTypeEnum { png, svg }

// transaction status

enum TransactionStatusEnum { complete, failed, mixed }

// customer care bottom sheet
enum CustomerCareBottomSheetEnum { natureOfIssue, channels }

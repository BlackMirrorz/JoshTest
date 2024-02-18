# Twinkl IOS Engineering
Mint: https://github.com/yonaskolb/Mint

Fastlane: https://docs.fastlane.tools

SwiftLint: https://github.com/realm/SwiftLint

SwiftFormat: https://github.com/nicklockwood/SwiftFormat

## Global Account
We use a global account for our applications signing.
The account is Twinkl Engineering: apps@twinkl.co.uk

## Required Files For All Repositories

### .gitignore
All our IOS Application use the same .gitignore
This is created using:
 ```
https://www.toptal.com/developers/gitignore/api/xcode,macos,swift
 ```
 
 ### .swiftlint.yml
 <details>
  <summary>Click to expand</summary>
 
  ```swift
 # Excluded Paths
excluded:
  - ${PWD}/Carthage
  - ${PWD}/Pods
  - ${PWD}/DerivedData
  - ${PWD}/3rdParty

# Disabled Rules
disabled_rules:
  - discarded_notification_center_observer
  - notification_center_detachment
  - orphaned_doc_comment
  - todo
  - unused_capture_list
  - trailing_closure
  - force_try
  - force_unwrapping
  - vertical_whitespace
  - collection_alignment
  - multiline_function_chains
  - closure_body_length
  - extension_access_modifier
  - multiline_arguments_brackets
  - generic_type_name

# Analyzer Rules
analyzer_rules:
  - unused_closure_parameter
  - unused_control_flow_label
  - unused_declaration
  - unused_enumerated
  - unused_import
  - unused_optional_binding
  - unused_setter_value

# Enforced Rules
opt_in_rules:
  - private_outlet
  - private_subject
  - private_action
  - array_init
  - block_based_kvo
  - closing_brace
  - closure_end_indentation
  - closure_parameter_position
  - closure_spacing
  - comma
  - comment_spacing
  - compiler_protocol_init
  - computed_accessors_order
  - contains_over_filter_count
  - contains_over_filter_is_empty
  - contains_over_first_not_nil
  - contains_over_range_nil_comparison
  - control_statement
  - convenience_type
  - deployment_target
  - discouraged_assert
  - discouraged_direct_init
  - discouraged_object_literal
  - duplicate_imports
  - dynamic_inline
  - empty_collection_literal
  - empty_count
  - empty_enum_arguments
  - empty_parameters
  - empty_parentheses_with_trailing_closure
  - empty_string
  - explicit_init
  - fatal_error_message
  - file_name_no_space
  - first_where
  - flatmap_over_map_reduce
  - for_where
  - function_parameter_count
  - identical_operands
  - identifier_name
  - implicit_getter
  - is_disjoint
  - joined_default_parameter
  - large_tuple
  - last_where
  - leading_whitespace
  - legacy_cggeometry_functions
  - legacy_constant
  - legacy_constructor
  - legacy_hashing
  - legacy_multiple
  - legacy_nsgeometry_functions
  - legacy_random
  - line_length
  - literal_expression_end_indentation
  - lower_acl_than_parent
  - mark
  - modifier_order
  - multiline_arguments
  - multiline_literal_brackets
  - multiline_parameters
  - multiline_parameters_brackets
  - multiple_closures_with_trailing_closure
  - no_fallthrough_only
  - no_space_in_method_call
  - nslocalizedstring_require_bundle
  - nsobject_prefer_isequal
  - number_separator
  - opening_brace
  - operator_usage_whitespace
  - operator_whitespace
  - optional_enum_case_matching
  - overridden_super_call
  - prefer_self_type_over_type_of_self
  - prefer_zero_over_explicit_init
  - private_over_fileprivate
  - prohibited_super_call
  - protocol_property_accessors_order
  - reduce_boolean
  - reduce_into
  - redundant_discardable_let
  - redundant_nil_coalescing
  - redundant_objc_attribute
  - redundant_optional_initialization
  - redundant_set_access_control
  - redundant_string_enum_value
  - redundant_type_annotation
  - redundant_void_return
  - required_enum_case
  - return_arrow_whitespace
  - shorthand_operator
  - sorted_first_last
  - statement_position
  - static_operator
  - superfluous_disable_command
  - switch_case_alignment
  - syntactic_sugar
  - toggle_bool
  - trailing_comma
  - trailing_newline
  - trailing_semicolon
  - type_body_length
  - unavailable_function
  - unneeded_break_in_switch
  - unneeded_parentheses_in_closure_argument
  - untyped_error_in_catch
  - valid_ibinspectable
  - vertical_parameter_alignment
  - vertical_parameter_alignment_on_call
  - void_return
  - weak_delegate
  - yoda_condition

# Custom Rules Thresholds

file_length:
  warning: 600
  error: 1000
  ignore_comment_only_lines: true

function_body_length:
  warning: 100
  error: 150

function_parameter_count:
  warning: 8
  error: 12

identifier_name:
  min_length:
    error: 1
    warning: 2
  max_length:
    warning: 60
    error: 100
  excluded:
    - id
    - Id
    - ID
    - on
    - On
    - ON
    - x
    - y
    - z
    - i
    - j
    - UI

type_name:
  excluded:
    - id
    - Id
    - ID
    - on
    - On
    - ON
    - UI

line_length:
  warning: 150
  error: 250
  ignores_comments: true

number_separator:
  minimum_length: 5

type_body_length:
  warning: 300
  error: 450

large_tuple:
  warning: 3
  error: 4

private_outlet:
  severity: warning

private_subject:
  severity: warning

private_action:
  severity: warning

# Custom Rules
custom_rules:
   no_print_statement:
    included: ".*\\.swift"
    name: "No Print Statement"
    regex: "print\\("
   message: "Print statement should be avoided. Use IOSLog instead."
   severity: warning
  ```
</details>
 
## Fastlane
Each repository we create uses Fastlane.
This helps us to automate tasks in our development pipeline.

### Clone The Project Repository
When you clone a repository you should ensure that you have Fastlane installed on your machine.

#### 1. Install Fastlane
```
brew install fastlane
```

#### 2. Instal Mint, SwiftFormat & SwiftLint
Once you have Fastlane installed run the following in Terminal:
```
cd path/to/your/project
cd fastlane
fastlane configureBaseDependencies
```
This checks that we have the latest version of Homebrew on our Machine, as well as Mint.
We then install the Minted(locked) versions of SwiftLint & SwiftFormat to ensure we are all on the same version. As of 18/02/2024 we are using:

SwiftFormat: ```0.53.1```
SwiftLint: ```0.53.0```

<details>
  <summary>twinklConfiguration.sh</summary>


  ```swift
  #!/bin/bash

# Define SwiftLint & SwiftFormat Versions

SWIFTFORMAT_VERSION="0.53.1"
SWIFTLINT_VERSION="0.53.0"

# Check to see if homebrew is installed on our developers machine
# If not we install the latest
# If it is check we have the latest
if ! command -v brew &> /dev/null
then
    echo "Homebrew not installed. Installing Homebrew..."
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        echo "✅ Homebrew installed successfully."
    else
        echo "❌ Failed to install Homebrew."
        exit 1
    fi
else
    echo "Homebrew is already installed. Updating Homebrew..."
    if brew update; then
        echo "✅ Homebrew updated successfully."
    else
        echo "❌ Failed to update Homebrew."
        exit 1
    fi
fi

# Install Mint to ensure that we lock our versions of SwiftLint and SwiftFormat
if ! command -v mint &> /dev/null; then
    echo "Mint is not installed. Installing Mint..."
    if ! brew install mint; then
        echo "❌ Failed to install Mint."
        exit 1
    fi
else
    echo "Mint is already installed. Checking for updates..."
    brew upgrade mint || echo "Mint is up to date."
fi

# Install SwiftFormat using Mint in our Repository
echo "Installing SwiftFormat version $SWIFTFORMAT_VERSION..."
if ! mint install nicklockwood/SwiftFormat@$SWIFTFORMAT_VERSION; then
    echo "❌ Failed to install SwiftFormat."
    exit 1
else
    echo "✅ SwiftFormat installed successfully."
fi

# Install SwiftLint using Mint in our Repository
echo "Installing SwiftLint version $SWIFTLINT_VERSION..."
if ! mint install realm/SwiftLint@$SWIFTLINT_VERSION; then
    echo "❌ Failed to install SwiftLint."
    exit 1
else
    echo "✅ SwiftLint installed successfully."
fi
  ```
</details>

### Fastlane Actions:
These help to automate common tasks.

#### 🚀 Configure Base Dependencies
Installs SwiftFormat and SwiftLine on your machine.
 ```
 fastlane configureBaseDependencies
 ```
 <details>
  <summary>Implementation</summary>
  
  ```swift
  # Setup Lint and Formatting Tools
lane :configureBaseDependencies do
  # Define SwiftLint & SwiftFormat Versions
  swiftformat_version = "0.53.1"
  swiftlint_version = "0.53.0"

  # Check for Homebrew and install if not present
  unless system("command -v brew > /dev/null 2>&1")
    UI.message("Homebrew not installed. Installing Homebrew...")
    system("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"") || UI.user_error!("❌ Failed to install Homebrew.")
    UI.success("✅ Homebrew installed successfully.")
  else
    UI.message("Homebrew is already installed. Updating Homebrew...")
    system("brew update") || UI.user_error!("❌ Failed to update Homebrew.")
    UI.success("✅ Homebrew updated successfully.")
  end

  # Install or update Mint
  unless system("command -v mint > /dev/null 2>&1")
    UI.message("Mint is not installed. Installing Mint...")
    system("brew install mint") || UI.user_error!("❌ Failed to install Mint.")
    UI.success("✅ Mint installed successfully.")
  else
    UI.message("Mint is already installed. Checking for updates...")
    system("brew upgrade mint") || UI.message("Mint is up to date.")
    UI.success("✅ Mint checked/updated successfully.")
  end

  # Install SwiftFormat using Mint
  UI.message("Installing SwiftFormat version #{swiftformat_version}...")
  system("mint install nicklockwood/SwiftFormat@#{swiftformat_version}") || UI.user_error!("❌ Failed to install SwiftFormat.")
  UI.success("✅ SwiftFormat installed successfully.")

  # Install SwiftLint using Mint
  UI.message("Installing SwiftLint version #{swiftlint_version}...")
  system("mint install realm/SwiftLint@#{swiftlint_version}") || UI.user_error!("❌ Failed to install SwiftLint.")
  UI.success("✅ SwiftLint installed successfully.")
end
  ```
</details>

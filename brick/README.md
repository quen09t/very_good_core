# Auth token template

Generate a templated app for token authentication with refresh token and connection persistence.
This briks is developed on top of [Very Good CLI][very_good_cli_link] 🦄.

## Usage 🚀

```sh
mason make auth_token_template
```

## Variables ✨

| Variable                   | Description                                                                  | Default                 | Type      |
| -------------------------- | ---------------------------------------------------------------------------- | ----------------------- | --------- |
| `project_name`             | The project name                                                             | `my_app`                | `string`  |
| `org_name`                 | The organization name                                                        | `com.example.app`       | `string`  |
| `description`              | A short project description                                                  | `Login template app`    | `string`  |
| `api_client_name`          | Your api name and the api package folder name                                | `codebuds`              | `string`  |
| `api_url`                  | Your base api url                                                            | `http://localhost:3000` | `string`  |
| `login_endpoint`           | Your api login endpoint                                                      | `/auth/login`           | `string`  |
| `forgot_password_endpoint` | Your api forgot password endpoint                                            | `/users/reset-password` | `string`  |
| `get_user_endpoint`        | Your api /me endpoint                                                        | `/users/me`             | `string`  |
| `refresh_token_endpoint`   | Your api refresh token endpoint                                              | `/auth/refresh`         | `string`  |
| `token_field`              | Your token field name returned by the api                                    | `accessToken`           | `string`  |
| `refresh_token_field`      | Your refresh token field returned by the api                                 | `refreshToken`          | `string`  |
| `is_bearer?`               | If is_bearer is set to true it will add "Bearer" to the Authorization header | `true`                  | `boolean` |

## Watch out 🚨

After generating the app remember to:

- `flutter pub get` in all the packages
- `dart run build_runner build` in the api client folder to generate models

[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli

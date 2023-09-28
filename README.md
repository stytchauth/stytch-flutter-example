# Stytch Flutter example application

## Overview

This example application demonstrates how one may use Stytch within a Flutter application.

This project uses Stytch's [API](https://stytch.com/docs/api/) to securely interact with Stytch.

This application features SMS OTP. You can use this application's source code as a learning resource, or use it as a jumping off point for your own project. We are excited to see what you build with Stytch!

## Set up

Follow the steps below to get this application fully functional and running using your own Stytch credentials.

### In the Stytch Dashboard

1. Create a [Stytch](https://stytch.com/) account. Once your account is set up a Project called "My first project" will be automatically created for you.

2. Within your new Project, navigate to [API Keys](https://stytch.com/dashboard/api-keys), and note your `project_id` and `secret`. You will need these values later on.

### On your machine

In your terminal clone the repo and open the project in VS Code:

```bash
git clone https://github.com/stytchauth/stytch-flutter-example.git
cd stytch-flutter-example
```

Add your `project_id` and `secret` to your `.vscode/launch.json` file:

```
{
  ...
  "configurations": [
    {
      "name": "stytch_flutter_example",
      ...
      "args": [
        "--dart-define=STYTCH_PROJECT_ID=project_id",
        "--dart-define=STYTCH_SECRET=secret"
      ]
    },
    ...
  ]
}
```

## Running the app

After completing all the set up steps above the application can be run as normally from VS Code.

You'll be able to login with SMS OTP and see your values from your Stytch User object as well as see how logging out works.

## Next steps

This example app showcases a small portion of what you can accomplish with Stytch. Here are a few ideas to explore:

1. Add additional login methods like [Passwords](https://stytch.com/docs/api/password-create).
2. Use [Stytch Sessions](https://stytch.com/docs/sessions) to secure your backend.

## Get help and join the community

#### :speech_balloon: Stytch community Slack

Join the discussion, ask questions, and suggest new features in our ​[Slack community](https://join.slack.com/t/stytch/shared_invite/zt-nil4wo92-jApJ9Cl32cJbEd9esKkvyg)!

#### :question: Need support?

Check out the [Stytch Forum](https://forum.stytch.com/) or email us at [support@stytch.com](mailto:support@stytch.com).

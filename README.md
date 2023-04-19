# Emoji Compose
> Terraform for Slack Emojis - liberation from emoji centralization!

GONE ARE THE DAYS OF EMOJI SUPPRESSION AND CENTRALIZATION!

Hear ye! Hear ye! For too long we proud, brave, and cheerful hearted emoji users have sheltered ourselves in quivering fear under the punishing hand of centralized emoji storage in a given Slack Workspace. Hours, days and even weeks of artistry, idealism, romantic pursuit of the perfect catalogue of emojis for any occasion are quashed in but the matter of moments; without hope for recompense in search of lost time. It is an undeniable truth that emojis, like information, yearn for the sweet freedom, like ambrosia, of multi-workspace Slack usage! But the people's desires have fallen upon unwilling and heedless ears to the tune of "more important product priorities" - heresy, but no longer; revolution has arrived!

Emoji Compose enables you to download precious Slack emojis from one workspace and transfer them to another through use of a standardized file format!

## Usage 

- Get a Slack Bot Token
- You need `emoji:read` permissions

```bash

bundle exec exe/emoji_compose pull --slack-token="your-slack-token" --name="emoji-freedom"

# Created emoji-compose.yml 
```

## Generated file 

```
---
workspace: test
emojis:
- black_square:
    image: url to slack 
    slackcode: ":black_square:"
- simple_smile:
    image: url to slack 
    slackcode: ":simple_smile:"
version: 0.0.1
```

## Future ideas 
- Option to download the image files for Slack independence

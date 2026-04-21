# ask-bash-project

A lightweight bash CLI wrapper for interacting with AI APIs. Send prompts via the command line and receive concise responses.

## Features

- Simple command-line interface for AI queries
- Support for piped input and command-line arguments
- Minimal dependencies (bash, curl, jq)
- Supports any OpenAI-compatible API

## Installation

1. Ensure you have `bash`, `curl`, and `jq` installed
2. Make the script executable:
   ```bash
   chmod +x ask
   ```
3. Set required environment variables

## Usage

### Setup Environment Variables

You must set three environment variables before using the script:

```bash
export ASK_API_URL="https://api.openai.com/v1/chat/completions"
export ASK_MODEL="llama-3.3-70b-versatile"
export ASK_API_KEY="your-api-key-here"
```

### Examples

**Direct command-line prompt:**
```bash
./ask "What is the capital of Turkey?"
```

**Piped input:**
```bash
echo "What is the capital of Turkey?" | ./ask
```

**Combine piped input with additional context:**
```bash
cat myfile.txt | ./ask "Summarize this text"
```

**Multi-word prompts:**
```bash
./ask "What is the" "capital of Turkey?"
```

## Limitations

- **Missing environment variables**: The script will exit with an error if `ASK_API_URL`, `ASK_MODEL`, or `ASK_API_KEY` are not set.
- **Dependencies required**: Requires `bash`, `curl`, and `jq` to be installed and available in PATH

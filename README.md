# ask-bash-project

A mini bash project for interacting with LLM APIs. Send prompts via the command line and receive responses.

## Features

- Simple command-line interface for LLM queries
- Support for piped input and command-line arguments
- Minimal dependencies (bash, curl, jq)
- Supports any OpenAI-compatible API

## Installation

1. Clone the project.
2. Ensure you have `bash`, `curl`, and `jq` installed
3. Make the script executable:
   ```bash
   chmod +x ask
   ```
4. Set required environment variables

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

**Alias Example**
```bash
alias ask-fix="./ask 'Correct any grammatical, spelling, or punctuation errors in the input text. Input text:'"

ask-fix Rhythim
Rhythm
```

## Limitations

- The script will exit with an error if `ASK_API_URL`, `ASK_MODEL`, or `ASK_API_KEY` are not set.
- Requires `bash`, `curl`, and `jq` to be installed and available in PATH
- If the API response format differs, jq output may need to be adjusted accordingly.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Please see the [CONTRIBUTING.md](CONTRIBUTING.md) guide for details on how to get involved.

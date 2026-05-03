# Phase 1 — FAN-OUT

all: quality.sum.md perf.sum.md security.sum.md

quality:
	{ echo 'You are reviewing source code for code quality only.' \
		    'Analyze the code provided below for readability, structure, maintainability, duplication, naming, unnecessary complexity, and organization.' \
		    'Do not focus on performance or security unless it directly affects code quality.' \
		    'Output must be valid Markdown.' \
		    'Output exactly 5-7 Markdown bullet points.' \
		    'Each bullet must follow this format: - Problem: <specific code quality issue> -> Fix: <specific improvement>.' \
		    'Be concrete. Mention file names, functions, or sections if visible in the input.' \
		    'Do not include an introduction or conclusion.' \
		    'Code to review:'; \
		cat codebase.txt; \
	} | ./ask > quality.md

performance:
	{ echo 'You are reviewing source code for performance only.' \
		    'Analyze the code provided below for bottlenecks, inefficient algorithms, unnecessary repeated work, excessive memory usage, slow I/O, avoidable network or database calls, and poor scalability.' \
		    'Do not focus on code style or security unless it directly affects performance.' \
		    'Output must be valid Markdown.' \
		    'Output exactly 5-7 Markdown bullet points.' \
		    'Each bullet must follow this format: - Issue: <specific performance problem> -> Optimization: <specific optimization>.' \
		    'Be concrete. Mention file names, functions, loops, queries, or sections if visible in the input.' \
		    'Do not include an introduction or conclusion.' \
		    'Code to review:'; \
		cat codebase.txt; \
	} | ./ask > perf.md

security:
	{ echo 'You are reviewing source code for security only.' \
		    'Analyze the code provided below for vulnerabilities, unsafe patterns, missing validation, injection risks, authentication or authorization problems, secret exposure, insecure configuration, unsafe file handling, and dependency-related risks.' \
		    'Do not focus on code style or performance unless it directly affects security.' \
		    'Output must be valid Markdown.' \
		    'Output exactly 5-7 Markdown bullet points.' \
		    'Each bullet must follow this format: - Risk: <specific security concern> -> Mitigation: <specific mitigation>.' \
		    'Be concrete. Mention file names, functions, endpoints, variables, or sections if visible in the input.' \
		    'Do not include an introduction or conclusion.' \
		    'Code to review:'; \
		cat codebase.txt; \
	} | ./ask > security.md

# Phase 2 — LOCAL SUMMARIZATION

quality.sum.md: quality
	{ echo 'You are summarizing a code quality review.' \
	       'Compress the review below into exactly 5 Markdown bullet points.' \
	       'Keep only actionable items.' \
	       'Remove repetition, vague comments, and low-priority observations.' \
	       'Each bullet must follow this format: - <actionable code quality fix>.' \
	       'Do not include an introduction or conclusion.' \
	       'Review to summarize:'; \
	  cat quality.md; \
	} | ./ask > quality.sum.md

perf.sum.md: performance
	{ echo 'You are summarizing a performance review.' \
	       'Compress the review below into exactly 5 Markdown bullet points.' \
	       'Keep only actionable optimization items.' \
	       'Remove repetition, vague comments, and low-priority observations.' \
	       'Each bullet must follow this format: - <actionable performance optimization>.' \
	       'Do not include an introduction or conclusion.' \
	       'Review to summarize:'; \
	  cat perf.md; \
	} | ./ask > perf.sum.md

security.sum.md: security
	{ echo 'You are summarizing a security review.' \
	       'Compress the review below into exactly 5 Markdown bullet points.' \
	       'Keep only actionable security items.' \
	       'Remove repetition, vague comments, and low-priority observations.' \
	       'Each bullet must follow this format: - <actionable security mitigation>.' \
	       'Do not include an introduction or conclusion.' \
	       'Review to summarize:'; \
	  cat security.md; \
	} | ./ask > security.sum.md

clean:
	rm -f quality.md perf.md security.md
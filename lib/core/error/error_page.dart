import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;
  final int? errorCode;
  final VoidCallback? onRetry;

  const ErrorPage({
    required this.errorMessage,
    final Key? key,
    this.errorCode,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 100.0,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Oops! Something went wrong.',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              if (errorCode != null) ...[
                const SizedBox(height: 8.0),
                Text(
                  'Error Code: $errorCode',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 8.0),
              Text(
                errorMessage,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              if (onRetry != null)
                ElevatedButton(
                  onPressed: onRetry,
                  child: const Text('Retry'),
                ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Go Back'),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () async {
                  context.go('/home'); // Navigate to home page
                },
                child: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

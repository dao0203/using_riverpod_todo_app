import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod_todo_app/providers.dart';

import '../../utils/const.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    return Scaffold(
      appBar: AppBar(
        //バックボタンにカラーをつける
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "プロフィール",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: profile.when(
            data: (data) => Padding(
              padding: padding8,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(
                      'https://github.com/${data.login}.png',
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.error,
                        size: 200,
                      ),
                      // loadingBuilder: (context, child, loadingProgress) =>
                      //     const Icon(
                      //   Icons.account_circle,
                      //   size: 200,
                      // ),
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  brank16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "フォロー数",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          brank8,
                          Text(
                            data.following.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      //githubのフォロワー数
                      Column(
                        children: [
                          const Text(
                            "フォロワー数",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          brank8,
                          Text(
                            data.followers.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  brank16,
                  //githubのbio
                  Text(
                    data.bio,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                  ),
                  brank16,
                  //githubの名前
                  Text(
                    data.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  brank16,
                  //githubのID
                  Text(
                    "@${data.login}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  brank16,
                  //githubの会社名
                  Text(
                    data.company,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  brank16,
                  //githubの場所
                  Text(
                    data.location,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  brank16,

                  Text(
                    data.twitterUsername,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  brank16,
                ],
              ),
            ),
            error: (error, stackTrace) => const Text("エラーが発生しました"),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

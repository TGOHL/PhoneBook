part of 'home_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('PhoneBook'),
              actions: [
                Switch.adaptive(
                    value: context.read<HomeCubit>().isDarkMode,
                    onChanged: ((value) =>
                        context.read<HomeCubit>().setDarkMode(value)))
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: context.read<HomeCubit>().searchController,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onChanged: context.read<HomeCubit>().search,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: context.read<HomeCubit>().contacts.length,
                    itemBuilder: (context, index) {
                      return ConatctTile(
                        contact: context.read<HomeCubit>().contacts[index],
                        onTap: () {
                          context.read<DetailsCubit>().setContact(
                              context.read<HomeCubit>().contacts[index]);
                          Navigator.of(context)
                              .pushNamed(DetailsScreen.routeName);
                        },
                        onDelete: () {
                          showAdaptiveDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog.adaptive(
                                title: const Text(
                                  "Are you sure?",
                                ),
                                content: const Text(
                                    "You cannot restore data that have been deleted."),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white24,
                                    ),
                                    child: const Text(
                                      "CANCEL",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.read<HomeCubit>().deleteContact(
                                          context
                                              .read<HomeCubit>()
                                              .contacts[index]
                                              .id);
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    child: const Text(
                                      "Delete",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<NewContactCubit>().setContact(null);
                Navigator.of(context).pushNamed(NewContactScreen.routeName);
              },
              tooltip: 'add',
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

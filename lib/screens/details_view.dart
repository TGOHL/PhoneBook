part of 'details_layout.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Contact? contact = context.watch<DetailsCubit>().contact;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NewContactCubit>().setContact(contact);
              Navigator.of(context).pushNamed(NewContactScreen.routeName);
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 36,
            width: MediaQuery.of(context).size.width,
          ),
          contact!.hasImage
              ? CircleAvatar(
                  backgroundImage: NetworkImage(contact.avatar!),
                  radius: 56,
                )
              : Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Colors.black54),
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    color: Colors.black54,
                    size: 86,
                  ),
                ),
          const SizedBox(
            height: 16,
          ),
          Text(
            contact.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 36,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 6, 0),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: const Icon(
                  Icons.call,
                  color: Colors.white,
                ),
              ),
              Text(
                contact.phone,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
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
                            Navigator.of(context).pop();
                            context.read<HomeCubit>().deleteContact(contact.id);
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
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'Delete Contact',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

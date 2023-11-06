part of 'new_contact_layout.dart';

class NewContactView extends StatelessWidget {
  const NewContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<NewContactCubit>().isNewContact
            ? 'Add New Contact'
            : 'Modify Contact'),
      ),
      body: Form(
        key: context.read<NewContactCubit>().key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 36,
                width: MediaQuery.of(context).size.width,
              ),
              !context.read<NewContactCubit>().isNewContact &&
                      context.read<NewContactCubit>().contact!.hasImage
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(context.read<NewContactCubit>().contact!.avatar!),
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
                height: 32,
              ),
              TextFormField(
                controller: context.read<NewContactCubit>().nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                ),
                validator: (val) {
                  if (val == null) return 'required field';
                  if (val.isEmpty) return 'required field';
                  if (val.length > 20) return 'too long';
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: context.read<NewContactCubit>().phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                ),
                validator: (val) {
                  if (val == null) return 'required field';
                  if (val.isEmpty) return 'required field';
                  if (val.length < 11) return 'too short';
                  if (val.length > 11) return 'too long';
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 48,
                child: ElevatedButton(
                  onPressed: context.read<NewContactCubit>().save,
                  child: const Text(
                    'Save Contact',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

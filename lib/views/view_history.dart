import 'package:flutter/material.dart';

class ViewHistory extends StatelessWidget {
  const ViewHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de reservas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3C4E67),
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Reservas:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C4E67),
                ),
              ),
              const SizedBox(height: 10),
              _buildReservationTile(
                image: 'assets/img/cochera1.jpg',
                title: 'Cochera de Juan',
                buttonText: 'Cancelar reserva',
                onPressed: () {},
              ),
              const SizedBox(height: 25),
              const Text(
                'Reservas pasadas:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C4E67),
                ),
              ),
              const SizedBox(height: 10),
              _buildPastReservationTile(
                image: 'assets/img/cochera2.jpg',
                title: 'Cochera de Mario',
              ),
              _buildPastReservationTile(
                image: 'assets/img/cochera3.jpg',
                title: 'Cochera de Jorge',
              ),
              _buildPastReservationTile(
                image: 'assets/img/cochera4.jpg',
                title: 'Cochera de David',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReservationTile({
    required String image,
    required String title,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 105,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFDCF4E5),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 168,
            height: 108,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C4E67),
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6CD391),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPastReservationTile({
    required String image,
    required String title,
  }) {
    return Container(
      height: 105,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFDCF4E5),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 168,
            height: 108,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C4E67),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import AVFoundation

@MainActor
class SoundManager {
    static let shared = SoundManager() 

    private var backgroundPlayer: AVAudioPlayer? // Player for background music
    private var effectPlayer: AVAudioPlayer? // Player for sound effects
    
    private init() {}
    
    // Play background music, on repeat
    func playBackgroundMusic(soundName: String, volume: Float = 1.0) {
        do {
            guard let path = Bundle.main.path(forResource: soundName, ofType: "wav") else {
                print("Arquivo de música de fundo não encontrado")
                return
            }
            let soundFile = URL(fileURLWithPath: path)
            backgroundPlayer = try AVAudioPlayer(contentsOf: soundFile)
            backgroundPlayer?.volume = max(0.0, min(volume, 1.0))
            backgroundPlayer?.numberOfLoops = -1 // Repetir indefinidamente
            backgroundPlayer?.prepareToPlay()
            backgroundPlayer?.play()
        } catch {
            print("Erro ao carregar a música de fundo: \(error)")
        }
    }
    
    // Stop Background music
    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
    }
    
    // Play the sound effects only once
    func playEffect(soundName: String, volume: Float = 1.0) {
        do {
            guard let path = Bundle.main.path(forResource: soundName, ofType: "wav") else {
                print("Arquivo de efeito sonoro não encontrado")
                return
            }
            let soundFile = URL(fileURLWithPath: path)
            effectPlayer = try AVAudioPlayer(contentsOf: soundFile)
            effectPlayer?.volume = max(0.0, min(volume, 1.0))
            effectPlayer?.prepareToPlay()
            effectPlayer?.play()
        } catch {
            print("Erro ao carregar o efeito sonoro: \(error)")
        }
    }
}



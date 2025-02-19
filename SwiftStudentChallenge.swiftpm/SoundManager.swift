import AVFoundation

@MainActor
class SoundManager {
    static let shared = SoundManager() // Singleton seguro

    private var backgroundPlayer: AVAudioPlayer? // Player para música de fundo
    private var effectPlayer: AVAudioPlayer? // Player para efeitos sonoros
    
    private init() {} // Impede múltiplas instâncias
    
    // Tocar música de fundo repetidamente
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
    
    // Parar música de fundo
    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
    }
    
    // Tocar efeito sonoro uma única vez
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



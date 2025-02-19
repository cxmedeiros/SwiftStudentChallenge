import AVFoundation

@MainActor
class SoundManager {
    static let shared = SoundManager() // Singleton seguro

    private var backgroundPlayer: AVAudioPlayer? // Player para música de fundo
    private var effectPlayer: AVAudioPlayer? // Player para efeitos sonoros
    
    private init() {} // Impede múltiplas instâncias
    
    // Função para obter o caminho do arquivo (aceita .mp3 e .wav)
    private func getSoundPath(for soundName: String) -> URL? {
        let formats = ["mp3", "wav"] // Lista de formatos aceitos
        
        for format in formats {
            if let path = Bundle.main.path(forResource: soundName, ofType: format) {
                return URL(fileURLWithPath: path)
            }
        }
        
        return nil // Nenhum arquivo encontrado
    }
    
    // Tocar música de fundo repetidamente
    func playBackgroundMusic(soundName: String, volume: Float = 1.0) {
        do {
            guard let soundFile = getSoundPath(for: soundName) else {
                print("Arquivo de música de fundo '\(soundName)' não encontrado")
                return
            }
            
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
            guard let soundFile = getSoundPath(for: soundName) else {
                print("Arquivo de efeito sonoro '\(soundName)' não encontrado")
                return
            }
            
            effectPlayer = try AVAudioPlayer(contentsOf: soundFile)
            effectPlayer?.volume = max(0.0, min(volume, 1.0))
            effectPlayer?.prepareToPlay()
            effectPlayer?.play()
        } catch {
            print("Erro ao carregar o efeito sonoro: \(error)")
        }
    }
}



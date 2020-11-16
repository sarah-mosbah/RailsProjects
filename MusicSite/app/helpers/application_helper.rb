module ApplicationHelper
    def lyrics(song)
        formatted_lyrics = ""
        song.lines.each do |line|
            formatted_lyrics << "&#9835; #{h(line)}"
        end
        "<pre> #{formatted_lyrics} </pre>".html_safe
    end
end

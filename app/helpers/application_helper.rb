module ApplicationHelper

  include Pagy::Frontend

  def flash_class(key)
    case key
    when 'notice'
      'flash-notice'  # Clase para notificaciones
    when 'alert'
      'flash-alert'    # Clase para alertas
    else
      'flash-info'     # Clase por defecto
    end
  end
end

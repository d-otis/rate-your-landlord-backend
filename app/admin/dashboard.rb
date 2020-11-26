ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      # span class: "blank_slate" do
        # span I18n.t("active_admin.dashboard_welcome.welcome")
        # small I18n.t("active_admin.dashboard_welcome.call_to_action")
      # end
    end

    # Here is an example of a simple dashboard with columns and panels.
    
    columns do
      column do
        panel "Recent Reviews" do
          ul do
            Review.last(15).map do |review|
              li link_to(review.property.address, admin_review_path(review))
            end
          end
        end
      end

      column do
        panel "Landlords" do
          ul do
            Landlord.all.map do |landlord|
              li link_to(landlord.name, admin_landlord_path(landlord))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end

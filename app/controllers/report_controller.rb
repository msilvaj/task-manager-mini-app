class ReportController < ApplicationController
    def index
        @user = current_user
        #selecinando apenas as tasks concluidas
        #nesse ponto o README.md deixa uma dúvida, se é pra listar apenas as tasks do usuário atual 
        #ou se é para listar as tasks de todos os usuários.
        #farei para listar de todos os usuários, deixando comentado logo abaixo como seria se fosse para gerar apenas do usuario atual

        #@tasks = @user.tasks.all.select { |statu| statu[:status] == "complete" }

        #aqui pego as tasks de todos os usuários filtrando pelo status "complete"
        @tasks = Task.all.select { |statu| statu[:status] == "complete" }
        

=begin
        <%= task.comments.all.each do |comment| %>
            <% puts comment.body %>
        <% end %>
=end
        respond_to do |format|
            format.html
        end
    end


end

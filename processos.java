import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Pagamento {

    public static void main(String[] args) {
        // Acesso ao banco de dados definido no host:porta
        String url = "jdbc:mysql://localhost:3306/banco";
        String username = "usuario";
        String password = "senha";

        try {
            // Definindo a conexão
            Connection connection = DriverManager.getConnection(url, username, password);
            Statement statement = connection.createStatement();

            // Consulta informações dos pedidos
            String sql = "SELECT p.descricaoPedido, e.nomeEmpresa, f.nomeFuncionario, f.salarioFuncionarios " +
                    "FROM pedidos p " +
                    "JOIN processo pr ON p.idProduto = pr.idProduto " +
                    "JOIN empresa e ON pr.idEmpresa = e.idEmpresa " +
                    "JOIN funcionarios f ON e.idEmpresa = f.idEmpresa";

            ResultSet resultSet = statement.executeQuery(sql);

            // Resultados da consulta
            while (resultSet.next()) {
                String descricaoPedido = resultSet.getString("descricaoPedido");
                String nomeEmpresa = resultSet.getString("nomeEmpresa");
                String nomeFuncionario = resultSet.getString("nomeFuncionario");
                float salarioFuncionarios = resultSet.getFloat("salarioFuncionarios");

                // Lógica de processamento dos pagamentos
                float valorPagamento = calcularPagamento(salarioFuncionarios);  // Exemplo de cálculo de pagamento

                // Printa pagamentos
                System.out.println("Descrição do Pedido: " + descricaoPedido);
                System.out.println("Empresa: " + nomeEmpresa);
                System.out.println("Funcionário: " + nomeFuncionario);
                System.out.println("Salário: " + salarioFuncionarios);
                System.out.println("Valor do Pagamento: " + valorPagamento);
                System.out.println("-------------------------------------");
            }

            // Fecha conexão ao banco
            resultSet.close();
            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

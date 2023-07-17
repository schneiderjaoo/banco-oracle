import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Pagamento {
    private static final String URL = "jdbc:mysql://localhost:3306/banco";
    private static final String USERNAME = "usuario";
    private static final String PASSWORD = "senha";

   private static float calcularPagamento(float salario) {
    // Lógica de processamento dos pagamentos
    float taxaImposto = 0.1f; // de 10%

    float valorPagamento = salario * (1 - taxaImposto); // Desconta o imposto

    return valorPagamento;
}

    }

    public static void main(String[] args) {
        try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             Statement statement = connection.createStatement()) {

            // Consultando informações 
            String sql = "SELECT p.descricaoPedido, e.nomeEmpresa, f.nomeFuncionario, f.salarioFuncionarios " +
                    "FROM pedidos p " +
                    "JOIN processo pr ON p.idProduto = pr.idProduto " +
                    "JOIN empresa e ON pr.idEmpresa = e.idEmpresa " +
                    "JOIN funcionarios f ON e.idEmpresa = f.idEmpresa";

            try (ResultSet resultSet = statement.executeQuery(sql)) {
                // Print das informações na tela
                while (resultSet.next()) {
                    String descricaoPedido = resultSet.getString("descricaoPedido");
                    String nomeEmpresa = resultSet.getString("nomeEmpresa");
                    String nomeFuncionario = resultSet.getString("nomeFuncionario");
                    float salarioFuncionarios = resultSet.getFloat("salarioFuncionarios");

                    // Lógica de processamento dos pagamentos
                    float valorPagamento = calcularPagamento(salarioFuncionarios);

                    // Printa pagamentos
                    System.out.println("Descrição do Pedido: " + descricaoPedido);
                    System.out.println("Empresa: " + nomeEmpresa);
                    System.out.println("Funcionário: " + nomeFuncionario);
                    System.out.println("Salário: " + salarioFuncionarios);
                    System.out.println("Valor do Pagamento: " + valorPagamento);
                    System.out.println("-------------------------------------");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
